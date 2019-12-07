class Task < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    validate :validate_name_not_includeing_comma

    # 各TaskはUserに1つだけ属する
    belongs_to :user

    scope :recent, -> { order(created_at: :desc) }
    # Ex:- scope :active, -> {where(:active => true)}

    # 検索対象にすることを許可するカラムを追加（デフォルトは全て）
    def self.ransackable_attributes(auth_object = nil)
      %w[name created_at]
    end

    # 検索条件に含める関連を指定（空の配列を返すことで、検索条件に意図しない関連を含めないようにすることができる）
    def self.ransackable_associations(auth_object = nil)
      []
    end

    private

      # 検証エラーを発見したら、errorsにエラー内容を格納する
      def validate_name_not_includeing_comma
        # nameにカンマが含まれていたらerrorsにエラー内容をaddする
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
      end

end
    