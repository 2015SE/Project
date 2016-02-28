class Member < ActiveRecord::Base
  def Member.check_membership(name, pass)
    @members = Member.all;
    @flag = 0
    @members.each do |r|
      puts r[:name], r[:passwd]
      if r[:name]==name and r[:passwd]==pass
        @flag = 1
      end
    end
    return @flag
  end
  def Member.insert(name, pass, phone, qq, is_leader)
    @m = Member.new
    @m.name = name
    @m.passwd = pass
    @m.phone = phone
    @m.qq = qq
    @m.is_leader = is_leader
    @m.save
  end
end
