require 'tty-prompt'
require_relative '../lib/marks_shower'

def is_num?(str)
    !!Integer(str)
  rescue ArgumentError, TypeError
    false
end
ms =  MarksShower.new
prompt = TTY::Prompt.new



while(true)
    arr =
    [
        {name: "Показать всех двоечников", value: :show_dv},
        {name: "Вычислять статистику тестирования", value: :show_st},
        {name: "Пересчитать оценки по другой шкале", value: :re_count},
        {name: "Проверить на возможное списывание", value: :get_cheaters},
        {name: "Найти три самых сложных вопроса", value: :get_hard},
        {name: "Выход", value: :exit}
    ].freeze


        command = prompt.select('Выберите действие',arr)
        if(command == :exit)
            break
        end
        if(command==:show_dv)
            ms.show_dv
        end
        if(command==:show_st)
            ms.show_st
        end
        if(command==:re_count)
            while(true)   
                tr_str = prompt.ask('Введите порогове значение для тройки')
                if(is_num?(tr_str))
                    break
                end
            end
            while(true)   
                ch_str = prompt.ask('Введите порогове значение для четверки')
                if(is_num?(ch_str))
                    break
                end
            end
            while(true)   
                pt_str = prompt.ask('Введите порогове значение для пятерки')
                if(is_num?( pt_str))
                    break
                end
            end
            pt = pt_str.to_i
            ch = ch_str.to_i
            tr = tr_str.to_i
            puts "Теперь пятерка ставится с #{pt} правильных ответов"
            puts "Теперь четверка ставится с #{ch} правильных ответов"
            puts "Теперь тройка ставится с #{tr} правильных ответов"
            ms.re_count(tr,ch,pt)
        end
        if(command==:get_cheaters)
            ms.get_cheaters
        end
      
        if(command==  :get_hard)
           # ms.get_hard
        end
       
end

