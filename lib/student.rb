class Student
    attr_accessor :cl, :name, :surename, :middlename, :right_answers, :marks_list
    def initialize(cl,surename, name, middlename, marks_list)
        @cl = cl
        @name = name
        @surename = surename
        @middlename = middlename
        @right_answers = 0
        @marks_list = marks_list
        marks_list.split('').each do |ans|
            if(ans=='1')
                @right_answers+=1
            end
        end

    end

    def to_s
        "#{@cl} #{@surename} #{@name} #{@middlename} Правильных ответов: #{@right_answers}"
    end
end

