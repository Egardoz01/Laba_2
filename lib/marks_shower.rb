require_relative 'marks_helper'
class MarksShower
    def initialize
        @mh = MarksHelper.new
    end
    def show_dv
        @mh.get_dv.each  do |st|
            puts st
        end
    end

    def show_st
        @mh.get_statistics.each  do |cl|
            puts "#{cl[0]} среднее кол-во правильных ответов: #{cl[1]} всего учеников:#{@mh.classes[cl[0]].length}"
    
        end
    end

    def re_count(tr,ch,pt)
        @mh.set_tr(tr)
        @mh.set_ch(ch)
        @mh.set_pt(pt)
        @mh.classes.each do |cl|
            puts cl[0]
            marks = Hash.new([])
            marks[2] = []
            marks[3] = []
            marks[4] = []
            marks[5] = []
            cl[1].each do |st|
                marks[@mh.get_mark(st)].push st
            end
            marks.each  do |mrk|
                puts "Оценка #{mrk[0]}"
                if(mrk[1].length == 0)
                    puts "Нет учеников, получивших эту оценку"
                end
                mrk[1].each do | st|
                    puts st                    
                end
            end
        end 

    end

    def get_cheaters
       arr = @mh.get_cheaters
        if(arr.length==0)
            puts "Списываний не обнаружено"
        end
        puts "эти пары учеников подозреваются в списывании"
        arr.each do |p|
            puts "#{p[0]} #{p[1]}"
        end
    end

    def get_hard
       
        
     end
end