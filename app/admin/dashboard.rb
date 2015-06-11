ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # # Here is an example of a simple dashboard with columns and panels.
    
    columns do
      column do
        panel "Total No. of Contacts" do
          ol do
            Contact.all.map do |contact|
              li (contact.Name)
            end
          end
        end
      end

      column do
        panel "Total No. of Groups" do
          ol do
            Group.all.map do |group|
              li (group.name)
            end
          end
        end
      end

      column do
        panel "Total No. of Skills" do
          ol do
            Skill.all.map do |skill|
              li (skill.name)
            end
          end
        end
      end

      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
    end
    columns do
    column do
        panel "Groups under Contacts" do
          para "Welcome to ActiveAdmin."
          ol do
            Group.all.map do |group|
                b li  (group.name)
                ol id:"#{group.name}", class:"my_hide" do
                  group.contacts.each do |cont|
                     li do cont.Name
                     end
                  end
                end
                end

           end
         end
    end
    column do
        panel "Groups Blocks & Skills under Contacts" do
          para "Welcome to ActiveAdmin."
          ol do
            Group.all.map do |group|
             div class: "block" do
                b (group.name)
                group.skills.each do |skill|
                    b name:"#{skill.name}_#{group.name}" do 
                      li skill.name

                    ul id:"#{skill.name}_#{group.name}", class:"my_hide" do
                    skill.contacts.each do |contact|
                       li contact.Name
                    end end
                    end end
                end
                end                
           end    
         end
    end
  end 
 end
end

