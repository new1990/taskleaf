class Task < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    validate :validate_name_not_includeing_comma

    # 各TaskはUserに1つだけ属する
    belongs_to :user

    scope :recent, -> { order(created_at: :desc) }
    # Ex:- scope :active, -> {where(:active => true)}

    private

      # 検証エラーを発見したら、errorsにエラー内容を格納する
      def validate_name_not_includeing_comma
        # nameにカンマが含まれていたらerrorsにエラー内容をaddする
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
      end

end
    