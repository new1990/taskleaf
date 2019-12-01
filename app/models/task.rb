class Task < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    validate :validate_name_not_includeing_comma

    private

      # 検証エラーを発見したら、errorsにエラー内容を格納する
      def validate_name_not_includeing_comma
        # nameにカンマが含まれていたらerrorsにエラー内容をaddする
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
      end

end
    