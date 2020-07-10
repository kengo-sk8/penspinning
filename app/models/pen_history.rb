class PenHistory < ActiveHash::Base
  self.data = [
    { id: 1, value: '半年未満' },
    { id: 2, value: '1年未満' },
    { id: 3, value: '2年未満' },
    { id: 4, value: '3年未満' },
    { id: 5, value: '4年未満' },
    { id: 6, value: '5年未満' },
    { id: 7, value: '6年未満' },
    { id: 8, value: '7年未満' },
    { id: 9, value: '8年未満' },
    { id: 10, value: '9年未満' },
    { id: 11, value: '10年以上' }
  ]
end
