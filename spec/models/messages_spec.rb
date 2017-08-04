require 'rails_helper'
describe Message do
  describe '#create' do
    it "メッセージがあれば保存できる" do
      message = build(:message, body: "aaa")
      message.valid?
      expect(message.errors[:image]).to include
    end

    it "画像あれば保存できる" do
      message = build(:message, image: "aaa")
      message.valid?
      expect(message.errors[:image]).to include
    end

    it "メッセージと画像があれば保存できる" do
      message = build(:message, body: "aaa", image: "aaa")
      message.valid?
      expect(message.errors[:body]).to include
      expect(message.errors[:image]).to include
    end

    it "メッセージも画像もないと保存できない" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:body]).to include
      expect(message.errors[:image]).to include
    end

    it "group_idが無いと保存できない" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group_id]).to include
    end

    it "user_idが無いと保存できない" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user_id]).to include
    end
  end
end
