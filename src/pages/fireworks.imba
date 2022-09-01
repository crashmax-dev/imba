import { Fireworks } from 'fireworks-js'

tag fireworks-page
	prop fireworks\Fireworks

	css
		b:0
		l:0
		w:100%
		pos:fixed
		bg:black

	def mount
		fireworks = new Fireworks($target)
		fireworks.start()

	def unmount
		fireworks.stop()
		$target.children[0].remove()

	def render
		<self>
			<div$target>
