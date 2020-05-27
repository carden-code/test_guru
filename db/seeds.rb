# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create([{ name: 'Slava', email: 'Slava@mail.ru' },
                    { name: 'Serg', email: 'Serg@mail.ru' }])

category = Category.create([{ name: :Biology },
                            { name: :Informatics },
                            { name: :History }])

test = Test.create([{ title: 'Higher plants', category: category[0], author: user[0] },
                    { title: 'Lower plants', category: category[0], author: user[0] },
                    { title: 'Vertebrate animals', category: category[0], author: user[0] },
                    { title: 'Basic informatics', level: 2, category: category[1], author: user[1] },
                    { title: 'General informatics', level: 2, category: category[1], author: user[1] },
                    { title: 'Pascal programming basics', level: 4, category: category[1], author: user[1] }])

question = Question.create([{ body: 'Сколько дней живут корневые волоски?',
                              test: test[0] },
                            { body: 'В клетках какой ткани происходят процессы фотосинтеза?',
                              test: test[0] },
                            { body: 'Откуда появляются придаточные корни?',
                              test: test[0] },
                            { body: 'Из скольких клеток состоит организм низших растений?',
                              test: test[1] },
                            { body: 'Из чего получают йод?',
                              test: test[1] },
                            { body: 'Как называется отдел ботаники, изучающий жизнь водорослей?',
                              test: test[1] },
                            { body: 'В каких отделах тела рыб мышцы развиты хорошо?',
                              test: test[2] },
                            { body: 'Сколько непарных плавников у рыб?',
                              test: test[2] },
                            { body: 'Какие млекопитающие плохо различают запахи?',
                              test: test[2] }])

Answer.create([{ body: '10-20', question: question[0], correct: true },
               { body: '1-2', question: question[0], correct: false },
               { body: '2-8', question: question[0], correct: false },
               { body: 'ассимиляционной', question: question[1], correct: true },
               { body: 'покровной', question: question[1], correct: false },
               { body: 'проводящей', question: question[1], correct: false },
               { body: 'от стебля', question: question[2], correct: true },
               { body: 'от бокового корня', question: question[2], correct: false },
               { body: 'от корнеплода', question: question[2], correct: false },
               { body: 'из одной или многих клеток', question: question[3], correct: true },
               { body: 'из многих клеток', question: question[3], correct: false },
               { body: 'из многих цепочечных клеток', question: question[3], correct: false },
               { body: 'из золы морских водорослей', question: question[4], correct: true },
               { body: 'из золы желто-зеленых водорослей', question: question[4], correct: false },
               { body: 'из золы сине-зеленых водорослей', question: question[4], correct: false },
               { body: 'альгология', question: question[5], correct: true },
               { body: 'эмбриология', question: question[5], correct: false },
               { body: 'микология', question: question[5], correct: false },
               { body: 'спины и хвоста', question: question[6], correct: true },
               { body: 'плечевого пояса', question: question[6], correct: false },
               { body: 'брюшка и спины', question: question[6], correct: false },
               { body: '3', question: question[7], correct: true },
               { body: '2', question: question[7], correct: false },
               { body: '4', question: question[7], correct: false },
               { body: 'дельфины и киты', question: question[8], correct: true },
               { body: 'дельфин и корова', question: question[8], correct: false },
               { body: 'крот и змея', question: question[8], correct: false }])

# TestPassage.connection.execute("INSERT INTO test_passages VALUES
#   (1, #{user[0]}, #{test[0].id}, #{question[0]}),
#   (2, #{user[0]}, #{test[2]}, #{question[0]}),
#   (3, #{user[0]}, #{test[4]}, #{question[0]}),
#   (4, #{user[1]}, #{test[1]}, #{question[0]}),
#   (5, #{user[1]}, #{test[3]}, #{question[0]}),
#   (6, #{user[1]}, #{test[5]}, #{question[0]});")
