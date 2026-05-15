import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../common_widgets/glass_container.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/constants.dart';

class AiPlaygroundSection extends StatefulWidget {
  const AiPlaygroundSection({super.key});

  @override
  State<AiPlaygroundSection> createState() => _AiPlaygroundSectionState();
}

class _AiPlaygroundSectionState extends State<AiPlaygroundSection> {
  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text: "System initialized. Neural core ready. How can I assist with your engineering tasks today?",
      isAi: true,
      isFinished: true,
    ),
  ];
  bool _isTyping = false;

  final Map<String, String> _mockPrompts = {
    "Create a SwiftUI login screen with animation": """
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "bolt.fill")
                .font(.system(size: 64))
                .foregroundColor(.blue)
                .rotation3DEffect(.degrees(isAnimating ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(.spring(response: 1, dampingFraction: 0.5).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear { isAnimating = true }
                
            VStack(spacing: 16) {
                TextField("Email", text: \$email)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: \$password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
            
            Button("Sign In") {
                // Perform login
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }
}
""",
    "Refactor Architecture": """
// Applying Clean Architecture principles...
// Extracting business logic from View to UseCase...

class FetchUserMetricsUseCase {
    private let repository: MetricsRepository

    init(repository: MetricsRepository) {
        self.repository = repository
    }

    func execute(userId: String) async throws -> UserMetrics {
        return try await repository.fetchMetrics(for: userId)
    }
}
""",
    "Review Code": "I've analyzed the snippet. The time complexity is O(N^2). Consider using a Set for O(1) lookups to improve performance, reducing overall complexity to O(N)."
  };

  void _handlePromptSelect(String promptKey) {
    if (_isTyping) return;

    setState(() {
      _messages.add(_ChatMessage(text: promptKey, isAi: false, isFinished: true));
      _messages.add(_ChatMessage(text: "", isAi: true, isFinished: false));
      _isTyping = true;
    });

    _simulateStreamingResponse(_mockPrompts[promptKey]!);
  }

  void _simulateStreamingResponse(String fullResponse) async {
    final chars = fullResponse.split('');
    String currentText = "";

    for (int i = 0; i < chars.length; i++) {
      await Future.delayed(const Duration(milliseconds: 20));
      if (!mounted) return;
      setState(() {
        currentText += chars[i];
        _messages.last = _ChatMessage(
          text: currentText,
          isAi: true,
          isFinished: i == chars.length - 1,
        );
      });
    }

    if (mounted) {
      setState(() {
        _isTyping = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.section),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, color: AppColors.accentPrimary, size: 32),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  "AI Playground (Beta)",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1, end: 0),
          const SizedBox(height: AppSpacing.sm),
          Text(
            "Interactive demonstration of custom developer tooling.",
            style: Theme.of(context).textTheme.bodyLarge,
          ).animate().fadeIn(delay: 200.ms, duration: 800.ms),
          const SizedBox(height: AppSpacing.xxl),
          
          GlassContainer(
            height: 600,
            padding: const EdgeInsets.all(AppSpacing.lg),
            border: Border.all(color: AppColors.accentPrimary.withValues(alpha: 0.3)),
            child: Column(
              children: [
                // Terminal Header
                Row(
                  children: [
                    _Circle(color: Colors.red[400]!),
                    const SizedBox(width: 8),
                    _Circle(color: Colors.yellow[400]!),
                    const SizedBox(width: 8),
                    _Circle(color: Colors.green[400]!),
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(
                      child: Text(
                        "user@neural-core:~",
                        style: codeTextStyle.copyWith(color: AppColors.textSecondary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Divider(color: AppColors.border, height: AppSpacing.xxl),
                
                // Terminal Body
                Expanded(
                  child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                        child: _MessageBubble(message: msg),
                      );
                    },
                  ),
                ),
                
                // Input Area / Prompts
                const Divider(color: AppColors.border, height: AppSpacing.xxl),
                Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: _mockPrompts.keys.map((key) {
                    return ActionChip(
                      label: Text(key),
                      onPressed: _isTyping ? null : () => _handlePromptSelect(key),
                      backgroundColor: AppColors.surfaceHighlight,
                      side: BorderSide(color: AppColors.accentPrimary.withValues(alpha: 0.5)),
                      labelStyle: TextStyle(color: _isTyping ? AppColors.textSecondary : AppColors.accentPrimary),
                    );
                  }).toList(),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms, duration: 800.ms).scaleXY(begin: 0.95, end: 1),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final Color color;
  const _Circle({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }
}

class _ChatMessage {
  final String text;
  final bool isAi;
  final bool isFinished;

  _ChatMessage({required this.text, required this.isAi, required this.isFinished});
}

class _MessageBubble extends StatelessWidget {
  final _ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          message.isAi ? Icons.memory : Icons.person,
          color: message.isAi ? AppColors.accentSecondary : AppColors.textSecondary,
          size: 20,
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.isAi ? "System" : "Engineer",
                style: codeTextStyle.copyWith(
                  color: message.isAi ? AppColors.accentSecondary : AppColors.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              if (message.isAi && message.text.contains("struct") || message.text.contains("class"))
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    border: Border.all(color: AppColors.border),
                  ),
                  width: double.infinity,
                  child: Text(message.text, style: codeTextStyle),
                )
              else
                RichText(
                  text: TextSpan(
                    style: codeTextStyle.copyWith(color: AppColors.textPrimary, height: 1.5),
                    children: [
                      TextSpan(text: message.text),
                      if (!message.isFinished && message.isAi)
                        TextSpan(
                          text: " █",
                          style: TextStyle(color: AppColors.accentPrimary),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
