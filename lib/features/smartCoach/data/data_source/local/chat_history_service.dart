import 'package:fitness_app/features/smartCoach/data/models/conversation_hive_model.dart';
import 'package:fitness_app/features/smartCoach/data/repo/chat_history_repo.dart';
import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChatHistoryService)
class ChatHistoryServiceImpl implements ChatHistoryService {
  static const String _boxName = 'conversations_v2';
  Box<ConversationHiveModel>? _box;

  @override
  Future<void> init() async {
    if (_box != null && _box!.isOpen) return;

    try {
      if (!Hive.isBoxOpen(_boxName)) {
        _box = await Hive.openBox<ConversationHiveModel>(_boxName);
      } else {
        _box = Hive.box<ConversationHiveModel>(_boxName);
      }
    } catch (e) {
      // If model schema changed or stored data is corrupt (e.g. a null where a non-null String is expected),
      // Hive may throw during box open. Recover by resetting the local box.
      log('ChatHistoryService init: failed to open box $_boxName, resetting. Error: $e');
      await Hive.deleteBoxFromDisk(_boxName);
      _box = await Hive.openBox<ConversationHiveModel>(_boxName);
    }
  }

  /// Save or update a conversation for a specific user
  @override
  Future<void> saveConversation(ConversationHiveModel conversation) async {
    await init();
    // Use composite key or just ID? The requirement says filter by userId.
    // We store by conversationId, but we must ensure we don't overwrite if IDs collide (unlikely with UUIDs).
    // Storing simply by conversationId is fine as long as UUIDs are unique.
    await _box!.put(conversation.conversationId, conversation);
  }

  /// Get all conversations for a specific user, sorted by updatedAt desc
  @override
  Future<List<ConversationHiveModel>> getUserConversations(
    String userId,
  ) async {
    await init();
    final all = _box!.values.toList();
    final userConversations = all.where((c) => c.userId == userId).toList();

    // Sort specific to user request: updatedAt descending (most recent first)
    userConversations.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return userConversations;
  }

  /// Get a specific conversation, ensuring it belongs to the user
  @override
  Future<ConversationHiveModel?> getConversation(
    String conversationId,
    String userId,
  ) async {
    await init();
    final conversation = _box!.get(conversationId);
    if (conversation != null && conversation.userId == userId) {
      return conversation;
    }
    return null;
  }

  /// Delete a specific conversation
  @override
  Future<void> deleteConversation(String conversationId, String userId) async {
    await init();
    final conversation = _box!.get(conversationId);
    if (conversation != null && conversation.userId == userId) {
      await _box!.delete(conversationId);
    }
  }

  /// Clear all history for a user
  @override
  Future<void> clearUserHistory(String userId) async {
    await init();
    final keysToDelete =
        _box!.values
            .where((c) => c.userId == userId)
            .map((c) => c.conversationId)
            .toList();

    await _box!.deleteAll(keysToDelete);
  }
}


