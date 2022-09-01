import './pages/index'

export tag App
	prop items = new Array(10).fill do() Math.random!
	prop value = 12

	def change
		document.body.style.setProperty('--font-size', "{value}px")

	def render
		<self>
			<nav>
				<a route-to="/"> "Home"
				<a route-to="/about"> "About"
				<a route-to="/todo"> "Todo"
				<a route-to="/syntax"> "Syntax"
				<a route-to="/code"> "Code"
			<section>
				<home-page route="/">
				<about-page route="/about">
				<todo-page route="/todo">
				<syntax-page route="/syntax">
				<code-page route="/code">
