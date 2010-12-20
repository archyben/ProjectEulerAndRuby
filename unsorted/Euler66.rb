class Integer
      def each_number &bloc
            nb = self

            loop do
                  bloc.call(nb)
                  nb+=1
            end
      end

      def square?
            tmp = (self**0.5)
            tmp.floor == tmp
      end
end

class Euler66
      def self.resolve(maxi)
            res = Array.new(2,0)
            2.upto(10000) do |d|
                  next if d.square?
                  pass = false
                  y = 1
                  1.each_number do |x|
                        break if pass
                        #puts "$$$$$$$$$$$ #{x}"
                        #1.upto(x-1) do |y|
                        while y < x
                              value = x**2 - d * (y**2)
                              if value == 1
                                    puts "#{x} #{y} #{d}"
                                    if x > res[0]
                                          res = x,d
                                    end
                                    pass = true
                                    break
                              elsif value < 1
                                    break
                              end
                              y+=1
                        end
                  end
            end
            return res[1]
      end
end

if __FILE__==$0
      puts Euler66.resolve(1000)
end