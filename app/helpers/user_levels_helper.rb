module UserLevelsHelper

    def sign_out_resource

        if current_user
            link_to "Sign out", destroy_user_session_path, :method => :delete 
        elsif current_admin
            link_to "Sign out", destroy_admin_session_path, :method => :delete 
        elsif current_instructor
            link_to "Sign out", destroy_instructor_session_path, :method => :delete 
        end

    end

end