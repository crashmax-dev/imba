import type { ITodo } from '../types'

tag todo-page
	prop page = 1
	prop todos\ITodo[] = []

	def loadTodo
		const response = await window.fetch("https://jsonplaceholder.typicode.com/todos/{page}")
		todos.push(await response.json())
		page++

	def deleteTodo(id\number)
		todos = todos.filter do(todo) todo.id != id

	def unmount
		todos.length = 0

	def render
		<self>
			<slot>
			<button @click=(await loadTodo())> "Load"
			for { id, title, completed } of todos
				<h1 @click.prevent=deleteTodo(id)> "#{id} {title} [{completed ? 'x' : ' '}]"
