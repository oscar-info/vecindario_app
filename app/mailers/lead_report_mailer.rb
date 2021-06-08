class LeadReportMailer < ApplicationMailer

    def lead_report(lead, emails, name_project)
        @lead = lead
        @name_project = name_project
        mail to: emails, subject: "Hay usuario interesado en tu proyecto!"
    end
end
