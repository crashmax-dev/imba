import format from '@crashmax/json-format-highlight'

tag code-page
	global css pre
		p:16px
		fs:14px
		rd:4px

	prop data = {
		id: 1
		name: 'john'
		dd: [
			1
			null
			true
		]
		a: {
			b: {
				c: false
			}
		}
	}

	def render
		<self>
			<code innerHTML=format(data, { tagPre: true })>
