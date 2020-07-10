json.array! @category_children do |child|
  json.id child.id  #[{"child.id": 1}, {たくさん続く}
  json.name child.name  #[{"child.name": "任意の値が入る"}, {たくさん続く}
end

#json.array!は、インスタンス変数のデータが複数ある場合に使用する。
#itemコントローラの@category_childrenから値を取得している
