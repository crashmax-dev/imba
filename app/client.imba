import { Todo } from './todo'
import { Autorender } from './autorender'
import './pages/about'
import './pages/home'

global css html
	ff:sans

# const sum = do(num1\number, num2\number)
# 	return num1 + num2

def sum(num1\number, num2\number)
	const num = num1 * 2
	num + num2

def onChange(event\Event)
	console.log(event.currentTarget\HTMLInputElement.value)

tag app
	prop items = new Array(10).fill do() Math.random!
	prop value = 12

	global css test fs:var(--font-size)
	global css test @hover bg:red5
	global css .input @focus bg:gray4

	def test(event\Event)
		console.log(event)

	def change
		document.body.style.setProperty('--font-size', "{value}px")

	def render
		console.log sum(2, 2)
		<self>
			<input @input.debounce=test>
			<nav>
				<a route-to="/"> "Home"
				<a route-to="/about"> "About"
			<section>
			<home-page route="/">
			<about-page route="/about">

imba.mount <app>
