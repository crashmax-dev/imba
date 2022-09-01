const colors = [
	'indigo'
	'amber'
	'blue'
	'cyan'
	'emerald',
	'red'
]

def random(max\number)
	Math.floor(Math.random() * max + 1)

def randomColor
	colors[random(colors.length - 1)] + random(3)

tag note
	prop color = randomColor()
	prop editable = false

	css
		max-width:6rem
		d:inline-block
		m:6
		pos:relative
		d:block
		fs:10px
		bxs:xl

	css @touch
		cursor:grab
		scale:1.05
		rotate:2deg
		zi:2

	css @move
		scale:1.05
		rotate:2deg
		zi:2

	def toggleEditable(event\MouseEvent)
		event.preventDefault()
		editable = !editable
		$text.focus()
		console.log $text

	def editNote(event\Event)
		$slot.textContent = event.target\HTMLTextAreaElement.value

	def build
		x = y = 0

	def render
		<self
			[bg:{color} x:{x} y:{y} p:2 word-break:break-all]
			@contextmenu=(e.preventDefault())
			@auxclick=toggleEditable
			@touch.moved.if(!editable).sync(self)
		>
			if editable
				<global @click.outside=(editable = false)>
				<textarea$text
					[bg:transparent resize:none w:6rem h:6rem fs:10px bd:none outline:none]
					@change.prevent=editNote
				> $slot.textContent
			else
				<span$slot>
					<slot>

tag notes-page
	prop notes\string[] = [
		'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsa, eius.'
	]

	def addNote
		const note = $input.value
		if note !== ''
			notes.push(note)
			$input.value = ''
			$input.focus()

	def render
		<self>
			<form @submit.prevent=addNote()>
				<input$input required>
				<button type="submot"> "Add"
			for note of notes
				<note> note
