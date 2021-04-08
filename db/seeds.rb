# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  {
    title: 'Ruby Metaprogramming',
    description: %{
      《Ruby元编程（第2版）》在大量剖析实例代码的基础上循序渐进地介绍Ruby特有的实用编程技巧。
      通过分析案例、讲解例题、回顾Ruby类库的实现细节，
      作者不仅向读者展示了元编程的优势及其解决问题的方式，更详细列出33种发挥其优势的编程技巧。
      本书堪称动态语言设计模式。Ruby之父松本行弘作序推荐。
    },
    image_url: '/images/ruby_metaprogramming.jpg',
    price: 49.0
  },
  {
    title: 'Javascript 权威指南',
    description: %{
      本书介绍JavaScript语言和由浏览器与Node实现的JavaScript API。
      本书适合有一定编程经验、想学习JavaScript读者，
      也适合已经在使用JavaScript但希望更深入地理解进而真正掌握这门语言的程序员。
      本书的目标是全面地讲解JavaScript语言，
      对JavaScript程序中可能用到的重要的客户端API和服务器端API提供深入的介绍。
      本书篇幅较长，内容非常详尽，相信认真研究本书的读者都能获益良多。
    },
    image_url: '/images/javascript_guide.jpg',
    price: 99.0
  }
].each do |p|
  Product.create(p)
end
