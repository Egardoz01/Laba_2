require_relative 'student.rb'
require "csv"
class MarksHelper
    attr_accessor :classes
    def initialize
        @classes = Hash.new([])
        load_data(__dir__+"/../data/test_results.csv")
        @porog3 = 21
        @porog4 = 26
        @porog5 = 31
    end
    def load_data(path)
        
        data = CSV.parse(File.read(path));
        data.each do |row|
            if(!@classes.key?(row[0]))
                @classes[row[0]] = []
            end
            name = row[1].split(' ')
            @classes[row[0]].push(Student.new(row[0],name[0],name[1],name[2],row[2])) 
        end

        @all_students = []
        @classes.each do |cl|
            cl[1].each do |st|
                @all_students.push st
            end
        end


    end

    def get_dv()
        arr_dv = []
        @classes.each do |cl| 
            cl[1].each do |st|
                if(st.right_answers < @porog3)
                    arr_dv.push(st)
                end
            end 
        end 
        arr_dv
    end
    def get_statistics
        aver = Hash.new
        @classes.each do |cl| 
            sum=0
            cl[1].each do |st|
               sum+=st.right_answers
            end 
            aver[cl[0]] = sum*1.0/cl[1].length
        end 
        return aver
    end
    def set_tr(tr)
        @porog3 = tr
       
    end
    def set_ch(ch)
        @porog4 = ch
  
    end
    def set_pt(pt)
        @porog5 = pt
  
    end

    def get_mark(st)
    
        return 2 if(st.right_answers < @porog3) 
        return 3 if(st.right_answers < @porog4) 
        return 4 if(st.right_answers < @porog5) 
        return 5
    end

    def get_cheaters()
        arr = []
       
        i=0
        while i<@all_students.length do
            j = i+1
            while j<@all_students.length do
                if(check( @all_students[i], @all_students[j]))
                    arr.push([@all_students[i], @all_students[j]])
                end
                j+=1
            end
            i+=1
        end
       
        return arr
    end

    def check(st1, st2)
        arr1 = st1.marks_list.split('')
        arr2 = st2.marks_list.split('')
        i=0
        cnt = 0
        while i<arr1.length do
            if arr1[i] == arr2[i]
                cnt+=1
            end
            i+=1
        end

        return cnt >= arr1.length-3
    end
    def get_hard
        all_students.each do |st| 
            
        end
     end
end

#mh = MarksHelper.new
#pp mh
