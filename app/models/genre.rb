class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'バトル' },
    { id: 3, name: 'ファンタジー' },
    { id: 4, name: 'SF' },
    { id: 5, name: '恋愛' },
    { id: 6, name: '青春' },
    { id: 7, name: 'ホラー' },
    { id: 8, name: 'グルメ' },
    { id: 9, name: 'ギャグ' },
    { id: 10, name: '日常' },
    { id: 11, name: 'スポーツ' },
    { id: 12, name: 'BL' },
    { id: 13, name: 'GL' },
    { id: 14, name: '成人' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :rooms

  end