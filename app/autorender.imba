export tag Autorender
	prop count = 0

	def render
		<self autorender=1s>
			<span> "Count: {<b> ++count}"
