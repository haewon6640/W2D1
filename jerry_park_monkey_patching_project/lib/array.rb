# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        self.max-self.min
    end

    def average
        return nil if self.length == 0
        self.inject {|accum,el| accum+el} / (self.length*1.0)
    end

    def median
        return nil if self.length == 0
        if self.length % 2 == 0
            return (self.sort[self.length/2 - 1] + self.sort[self.length/2])/(2.0)
        end
        return self.sort[self.length/2]
    end
    def counts
        hash = Hash.new(0)
        self.each {|val| hash[val]+=1}
        hash
    end
    def my_count(value)
        count = 0
        self.each {|val| count+=1 if value == val}
        count
    end
    def my_index(arg)
        self.each_with_index {|val,i| return i if val == arg}
        return nil
    end
    def my_uniq
        unique = Array.new(0)
        self.select! do |val|
            if unique.include?(val)
                false
            else 
                unique << val
                true
            end
        end
    end
    def my_transpose
        newArr = Array.new(self.length) {Array.new(self.first.length)}
        self.each_with_index do |row, i|
            row.each_with_index do |col, j|
                newArr[j][i] = col
            end
        end
        newArr
    end




end
