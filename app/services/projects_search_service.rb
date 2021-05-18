class ProjectsSearchService
    def self.search(curr_project, query)
        curr_project.where("name_project like '%#{query}%'")
    end
end