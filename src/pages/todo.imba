import type { Todo } from '../types'

def nanoid
	Math.random().toString(16).slice(2)

tag todo-page
	prop todos\Map<string, Todo[]> = new Map()

	def addTodo()
		const completed = $completed.checked
		const title = $title.value

		if title != ''
			todos.set(nanoid!, { title, completed })
			$title.value = ''
			$completed.checked = false
			$title.focus()

	def deleteTodo(id\string)
		todos.delete(id)

	def toggleTodo(id\string)
		const { title, completed } = todos.get(id)
		todos.set(id, { title, completed: !completed })

	def unmount
		todos.clear()

	def render
		<self>
			<form @submit.prevent=addTodo()>
				<input$title required>
				<input$completed type="checkbox">
				<button type="submit"> "Add"
			for [id, { title, completed }] of todos
				<div>
					<span[cursor:pointer td:{completed ? 'line-through' : 'underline'}]> title
					<input @change.prevent=toggleTodo(id) type="checkbox" checked=completed>
					<button @click.prevent=deleteTodo(id)> "Delete"
