class Admin < ActiveRecord::Base
  def Admin.check_membership(name, pass)
    @admins = Admin.all;
    @flag = 0
    @admins.each do |r|
      puts r[:admin_name], r[:passwd]
      if r[:admin_name]==name and r[:passwd]==pass
        @flag = 1
      end
    end
    return @flag
  end
end
