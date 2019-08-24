class User < ApplicationRecord
    # include Searchable

    # def self.testProc
    #     my_proc = Proc.new { return 10 }
    #     my_proc.call
    #     puts "ay 7agaaa"
    # end
     
    # def self.testLmbda
    #     my_lambda = lambda { return 10 }
    #     my_lambda.call
    #     puts "ay 7agaaa"
    # end
     
    # def self.anony
    #     if( 5 > 0)
    #         return 1000
    #     end
    #     puts "foooooooooooozy"
    # end
        
    # def self.multiple_procs(proc1, proc2)
    #     proc1.call
    #     proc2.call
    # end

    # def self.method1
    #     return 10
    # end

    # def self.method2
    #     puts method1
    #     return 'tmam kda'
    # end

    # def self.testTime
    #     p = Proc.new {return Time.now}
    #     lam = lambda {return Time.now}
    #     puts lam.call
    #     p.call
    # end

    def self.method_1
        return 24
    end

    def self.method_2(age)
        puts "i have #{age} old"
    end

    def self.check(proc1, proc2)
        proc1.call(24)
    end
    
end