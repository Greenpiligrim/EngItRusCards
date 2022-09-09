//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//
import Foundation

class EnglishFrasesDataServise {
    
    static let FrasesCard: [Frases] = [
    Frases(eng: "Let's go!", rus: "Нажми кнопку 👇🏻", it: "Salve.", rusIt: "Привет."),
    Frases(eng: "It's a no-brainer.", rus: "Это очевидно.", it: "Grazie.", rusIt: "Спасибо."),
    Frases(eng: "I feel woozy.", rus: "Что-то мне не хорошо.", it: "Per favore.", rusIt: "Пожалуйста."),
    Frases(eng: "Go ahead, I'm all ears.", rus: "Продолжай, я весь внимание.", it: "Scusa.", rusIt: "Простите."),
    Frases(eng: "Cut it out!", rus: "Прекрати! Хватит! Перестань!", it: "Ciao.", rusIt: "Здравствуйте."),
    Frases(eng: "Something's fishy.", rus: "Что-то тут не чисто.", it: "Arrivederci.", rusIt: "До свидания."),
    Frases(eng: "Let's play it by ear.", rus: "Давай решим по ходу дела.", it: "Aiuto.", rusIt: "Помогите."),
    Frases(eng: "I need a nap.", rus: "Мне надо вздремнуть.", it: "Domanda.", rusIt: "Вопрос."),
    Frases(eng: "I'm just fooling around.", rus: "Я просто прикалываюсь.", it: "Pericolo.", rusIt: "Опасность."),
    Frases(eng: "It's a sure thing!", rus: "Верняк!", it: "Sicuro", rusIt: "Безопасно."),
    Frases(eng: "Don't mess with me!", rus: "Не шути со мной!", it: "Puo essere.", rusIt: "Может быть."),
    Frases(eng: "Don't freak out.", rus: "Не пугайся. Не кипишуй.", it: "Avviso.", rusIt: "Предупреждение."),
    Frases(eng: "Get used to it.", rus: "Свыкнись с этим", it: "Guaio.", rusIt: "Беда."),
    Frases(eng: "I'm not in the mood.", rus: "Я не в настроении.", it: "Amico.", rusIt: "Друг."),
    Frases(eng: "Are you nuts?", rus: "Ты спятил?", it: "Nemico.", rusIt: "Враг."),
    Frases(eng: "Are you mocking me?", rus: "Ты издеваешься?", it: "Nulla.", rusIt: "Ничего."),
    Frases(eng: "I rest my case.", rus: "Я все сказал.", it: "Ripidamente.", rusIt: "Круто."),
    Frases(eng: "Keep me posted.", rus: "Держи меня в курсе.", it: "Si.", rusIt: "Да."),
    Frases(eng: "Are we good?", rus: "У нас все хорошо?", it: "No.", rusIt: "Нет."),
    Frases(eng: "Who cares?", rus: "Какая разница?", it: "Gente.", rusIt: "Люди."),
    Frases(eng: "What time is it?", rus: "Который час?", it: "Persona.", rusIt: "Человек."),
    Frases(eng: "Next time lucky.", rus: "В следующий раз повезет.", it: "Donna.", rusIt: "Женщина."),
    Frases(eng: "What a pity!", rus: "Как жаль!", it: "Uomo.", rusIt: "Мужчина."),
    Frases(eng: "It didn't work out.", rus: "Ничего не вышло.", it: "Bambino.", rusIt: "Ребенок."),
    Frases(eng: "I've changed my mind.", rus: "Я пердумал.", it: "Ragazzo.", rusIt: "Мальчик, парень."),
    Frases(eng: "That makes sense.", rus: "Это логично.", it: "Ragazza.", rusIt: "Девочка."),
    Frases(eng: "I'm not quite sure.", rus: "Я не совсем уверен.", it: "Genitori.", rusIt: "Родители."),
    Frases(eng: "I don't mind.", rus: "Я не возражаю.", it: "Madre.", rusIt: "Мать."),
    Frases(eng: "I have no idea.", rus: "Понятия не имею.", it: "Padre.", rusIt: "Отец."),
    Frases(eng: "Just be yourself.", rus: "Просто будь самим собой.", it: "Figlio.", rusIt: "Сын."),
    Frases(eng: "It doesn't count.", rus: "Это не считается.", it: "Figlia.", rusIt: "Дочь."),
    Frases(eng: "I'll ask around.", rus: "Я поспрашиваю.", it: "Nonno.", rusIt: "Дедушка."),
    Frases(eng: "No offense.", rus: "Без обид.", it: "Nonna.", rusIt: "Бабушка."),
    Frases(eng: "How dare you!", rus: "Да как ты смеешь!", it: "Famiglia.", rusIt: "Семья."),
    Frases(eng: "Just the opposite.", rus: "Как раз наоборот.", it: "Sorella.", rusIt: "Сестра."),
    Frases(eng: "It drives me crazy.", rus: "Это сводит меня с ума.", it: "Fratello.", rusIt: "Брат."),
    Frases(eng: "Just pull yourself together!", rus: "Возьми себя в руки!", it: "Zio.", rusIt: "дядя."),
    Frases(eng: "I screwed up.", rus: "Я облажался.", it: "Zia.", rusIt: "Тетя."),
    Frases(eng: "At the end of the day.", rus: "В конце концов.", it: "Moglie.", rusIt: "Жена."),
    Frases(eng: "Are you in?", rus: "Ты с нами?", it: "Marito.", rusIt: "Муж."),
    Frases(eng: "Yes, I'm in!", rus: "Да, я с вами!", it: "Ospite.", rusIt: "Гость."),
    Frases(eng: "Count me in!", rus: "Можете на меня рассчитывать!", it: "Beniamino", rusIt: "Любимец."),
    Frases(eng: "Good for you!", rus: "Хорошо для тебя!", it: "Tempo.", rusIt: "Время."),
    Frases(eng: "Steer clear of him!", rus: "Держись от него подальше!", it: "Adesso.", rusIt: "Сейчас."),
    Frases(eng: "Keep up the good work!", rus: "Продолжай в том же духе!", it: "Passato.", rusIt: "Прошлое."),
    Frases(eng: "Don't show off, okay.", rus: "Не выделывайся ок?", it: "Futuro.", rusIt: "Будущее."),
    Frases(eng: "It doesn't matter what I said.", rus: "Не важно что я сказал", it: "Anno.", rusIt: "Год."),
    Frases(eng: "Time is up.", rus: "Время вышло.", it: "Mese.", rusIt: "Месяц."),
    Frases(eng: "Say no more", rus: "Ни слова больше.", it: "Settimana.", rusIt: "Неделя."),
    Frases(eng: "What a relief!", rus: "Какое облегчение!", it: "Ora.", rusIt: "Час."),
    Frases(eng: "I hope for the best.", rus: "Я надеюсь на лучшее.", it: "Minuto.", rusIt: "Минута."),
    Frases(eng: "The choice is yours.", rus: "Тебе выбирать.", it: "Secondo.", rusIt: "Секунда."),
    Frases(eng: "Come on, let's grab a bite.", rus: "Ладно, давай перекусим.", it: "Numero.", rusIt: "Номер."),
    Frases(eng: "You must be very upset about it. 68", rus: "Вы должно быть очень расстроились из-за этого.", it: "Ieri.", rusIt: "Вчера.7"),
    Frases(eng: "", rus: "", it: "", rusIt: ""),
    Frases(eng: "", rus: "", it: "", rusIt: ""),
    Frases(eng: "", rus: "", it: "", rusIt: ""),
    Frases(eng: "", rus: "", it: "", rusIt: "")

    ]
}
