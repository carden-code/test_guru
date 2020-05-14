# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = Category.create([{ name: :Biology },
                            { name: :Informatics },
                            { name: :History }])

test = Test.create([{ title: 'Higher plants', category_id: category[0].id },
                    { title: 'Lower plants', category_id: category[0].id },
                    { title: 'Vertebrate animals', category_id: category[0].id },
                    { title: 'Basic informatics', category_id: category[1].id },
                    { title: 'General informatics', category_id: category[1].id },
                    { title: 'Pascal programming basics', category_id: category[1].id }])
question = Question.create([{ body: 'Сколько дней живут корневые волоски?',
                              test_id: test[0].id },
                            { body: 'В клетках какой ткани происходят процессы фотосинтеза?',
                              test_id: test[0].id },
                            { body: 'Откуда появляются придаточные корни?',
                              test_id: test[0].id },
                            { body: 'Из скольких клеток состоит организм низших растений?',
                              test_id: test[1].id },
                            { body: 'Из чего получают йод?',
                              test_id: test[1].id },
                            { body: 'Как называется отдел ботаники, изучающий жизнь водорослей?',
                              test_id: test[1].id },
                            { body: 'В каких отделах тела рыб мышцы развиты хорошо?',
                              test_id: test[2].id },
                            { body: 'Сколько непарных плавников у рыб?',
                              test_id: test[2].id },
                            { body: 'Какие млекопитающие плохо различают запахи?',
                              test_id: test[2].id }])
Answer.create([{ body: '10-20', question_id: question[0].id, correct: true },
               { body: '1-2', question_id: question[0].id, correct: false },
               { body: '2-8', question_id: question[0].id, correct: false },
               { body: 'ассимиляционной', question_id: question[1].id, correct: true },
               { body: 'покровной', question_id: question[1].id, correct: false },
               { body: 'проводящей', question_id: question[1].id, correct: false },
               { body: 'от стебля', question_id: question[2].id, correct: true },
               { body: 'от бокового корня', question_id: question[2].id, correct: false },
               { body: 'от корнеплода', question_id: question[2].id, correct: false },
               { body: 'из одной или многих клеток', question_id: question[3].id, correct: true },
               { body: 'из многих клеток', question_id: question[3].id, correct: false },
               { body: 'из многих цепочечных клеток', question_id: question[3].id, correct: false },
               { body: 'из золы морских водорослей', question_id: question[4].id, correct: true },
               { body: 'из золы желто-зеленых водорослей', question_id: question[4].id, correct: false },
               { body: 'из золы сине-зеленых водорослей', question_id: question[4].id, correct: false },
               { body: 'альгология', question_id: question[5].id, correct: true },
               { body: 'эмбриология', question_id: question[5].id, correct: false },
               { body: 'микология', question_id: question[5].id, correct: false },
               { body: 'спины и хвоста', question_id: question[6].id, correct: true },
               { body: 'плечевого пояса', question_id: question[6].id, correct: false },
               { body: 'брюшка и спины', question_id: question[6].id, correct: false },
               { body: '3', question_id: question[7].id, correct: true },
               { body: '2', question_id: question[7].id, correct: false },
               { body: '4', question_id: question[7].id, correct: false },
               { body: 'дельфины и киты', question_id: question[8].id, correct: true },
               { body: 'дельфин и корова', question_id: question[8].id, correct: false },
               { body: 'крот и змея', question_id: question[8].id, correct: false }])
User.create(name: 'Slava', age: 30)
