switch (state) {
	case sacrificeState.IDLE:
		break;
	case sacrificeState.FALL:
		break;
	case sacrificeState.ALTER:
		break;
}
draw_self();


draw_text(x, y - 20, state == alterState);