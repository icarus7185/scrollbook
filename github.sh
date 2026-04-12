#!/bin/bash

# ==========================================
# CẤU HÌNH THÔNG TIN CỦA BẠN Ở ĐÂY
# ==========================================
EMAIL="icarus7185@gmail.com"
KEY_PATH="$HOME/.ssh/id_ed25519"

# Đọc tham số đầu tiên truyền vào khi gọi script (ví dụ: ./auto_ssh.sh true)
OVERWRITE=$1

echo "🚀 Bắt đầu tự động tạo SSH Key cho email: $EMAIL"

# 1. Kiểm tra và xử lý ghi đè nếu file key đã tồn tại
if [ -f "$KEY_PATH" ]; then
    if [ "$OVERWRITE" = "true" ]; then
        echo "⚠️ Khóa SSH cũ đã tồn tại. Đang tiến hành xóa để ghi đè do tham số 'true' được truyền vào..."
        # Xóa cả Private key và Public key cũ để ssh-keygen không hỏi lại
        rm -f "$KEY_PATH" "${KEY_PATH}.pub"
    else
        echo "🛑 Cảnh báo: File khóa SSH ($KEY_PATH) đã tồn tại!"
        echo "💡 Nếu bạn chắc chắn muốn xóa khóa cũ và tạo lại, hãy chạy lệnh:"
        echo "   ./auto_ssh.sh true"
        exit 1
    fi
fi

# 2. Tạo SSH Key tự động
ssh-keygen -q -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""
echo "✅ Đã tạo khóa thành công tại $KEY_PATH"

# 3. Bật ssh-agent và thêm Private Key
eval "$(ssh-agent -s)" > /dev/null
ssh-add "$KEY_PATH" 2> /dev/null
echo "✅ Đã thêm khóa vào ssh-agent"

# 4. Copy Public Key vào Clipboard
echo "🔍 Đang xử lý copy Public Key..."

if command -v xclip &> /dev/null; then
    cat "${KEY_PATH}.pub" | xclip -selection clipboard
    echo "📋 Đã copy Public Key vào Clipboard (dùng xclip)!"
elif command -v xsel &> /dev/null; then
    cat "${KEY_PATH}.pub" | xsel --clipboard --input
    echo "📋 Đã copy Public Key vào Clipboard (dùng xsel)!"
elif command -v wl-copy &> /dev/null; then
    cat "${KEY_PATH}.pub" | wl-copy
    echo "📋 Đã copy Public Key vào Clipboard (dùng wl-copy)!"
else
    echo "⚠️ Máy bạn chưa cài công cụ hỗ trợ copy (xclip/xsel/wl-copy)."
    echo "👇 Vui lòng bôi đen và COPY đoạn text dưới đây:"
    echo -e "\e[1;32m"
    cat "${KEY_PATH}.pub"
    echo -e "\e[0m"
fi

echo "🎉 HOÀN TẤT! Hãy dán khóa này lên GitHub."