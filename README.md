# Мои задачи

[app-mytasks](https://app-mytasks.herokuapp.com/) - API для списка задач на Ruby on Rails.

Предоставляет следующие методы:
- **GET /projects** — вернуть все проекты с задачами;
- **POST /todos** — создать новую задачу;
- **PATCH /projects/id/todos/id** — обновить задачу.

Примерная структура:
```
[{
  id: int,
  title: string,
  todos: [
    {
      id: int,
      text: string,
      is_completed: bool
    }
  ]
}]
```
