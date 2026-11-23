hl.bind(
	"SUPER+R",
	hl.dsp.exec_cmd(
		"cd ~/Projekty/git-personal/facesearch&&source /home/imfl/Projekty/git-personal/facesearch/.venv/bin/activate&&~/Projekty/git-personal/facesearch/screen-recognize&& notify-send start"
	),
	{ repeating = false }
)
hl.bind(
	"SUPER+R",
	hl.dsp.exec_cmd(
		"cd ~/Projekty/git-personal/facesearch&&source /home/imfl/Projekty/git-personal/facesearch/.venv/bin/activate&&~/Projekty/git-personal/facesearch/screen-recognize -r &&notify-send stop"
	),
	{ release = true }
)
