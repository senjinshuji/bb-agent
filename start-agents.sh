#!/bin/bash

# 🤖 BB-Project Agents Launcher (6エージェント一括起動)

echo "🤖 Agents (Writers + Personas) 一括起動中..."

# セッション存在確認
if ! tmux has-session -t bb-agents 2>/dev/null; then
    echo "❌ エラー: bb-agentsセッションが見つかりません"
    echo "💡 まず './setup-bb.sh' を実行してください"
    exit 1
fi

# エージェント名定義
AGENTS=("persona1" "persona2" "persona3" "writer1" "writer2" "writer3")

# 各エージェントでClaude CLI起動
echo "📤 6エージェントでClaude CLI起動中..."

for i in {0..5}; do
    agent_name=${AGENTS[$i]}
    echo "  └─ $agent_name 起動中..."
    tmux send-keys -t "bb-agents:0.$i" "/Users/shjkt/.nvm/versions/node/v24.1.0/bin/claude --dangerously-skip-permissions" C-m
    sleep 0.5  # 起動間隔を少し空ける
done

echo ""
echo "✅ Agents 一括起動完了！"
echo ""
echo "📋 次のステップ:"
echo "  1. tmux attach -t bb-agents でセッションにアタッチ"
echo "  2. 各エージェントでClaude CLI認証完了後、以下を入力:"
echo "     Persona1: あなたはPersona1です。指示書に従って"
echo "     Persona2: あなたはPersona2です。指示書に従って"
echo "     Persona3: あなたはPersona3です。指示書に従って"
echo "     Writer1:  あなたはWriter1です。指示書に従って"
echo "     Writer2:  あなたはWriter2です。指示書に従って"
echo "     Writer3:  あなたはWriter3です。指示書に従って"
echo ""
echo "📜 指示書:"
echo "  Writer1-3: instructions/writer[1-3].md"
echo "  Persona1-3: instructions/persona[1-3].md" 