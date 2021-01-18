FILE_PATH = [Rails.root, 'public', 'seeds.yml'].join('/')
DEMO_DATA = YAML.load_file FILE_PATH

def create_projects
  DEMO_DATA['projects'].each do |project|
    return if Project.where(title: project['title']).exists?
    p = Project.create!(title: project['title'])

    project['todos'].each do |todo|
      todo_params = {text: todo['text'], project_id: p.id, is_completed: todo['isCompleted']}
      p.todos.create! todo_params
    end
  end
end

create_projects