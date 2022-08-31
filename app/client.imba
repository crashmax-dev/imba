import { Todo } from './todo'
import { Autorender } from './autorender'

global css html
	ff:sans

def onChange(event\Event)
	console.log(event.currentTarget\HTMLInputElement.value)

tag app
	prop items = ['a','b','c','d'].map do(item) item.toUpperCase!
	prop value = 12

	global css test fs:var(--font-size)
	global css test @hover bg:red5
	global css .input @focus bg:gray4

	def change
		document.body.style.setProperty('--font-size', "{value}px")

	def render
		<self>
			<header>
				<Todo>
					<h1> "hello"
				<input.input type="number" @input.prevent=onChange bind=value>
				if value > 10
					<p> value
				<hr>
				<Autorender>
				<hr>
				for item in items
					<p> item

imba.mount <app>
