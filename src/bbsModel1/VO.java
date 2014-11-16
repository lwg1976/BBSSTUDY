package bbsModel1;

public class VO {
	private int num;
	private String name;
	private String password;
	private String title;
	private String memo;
	private String time;
	private int hit;
	private int ref;
	private int indent;
	private int step;
	private boolean dayNew;
	
	public VO() {}
	
	public VO(int num, String name, String password, String title,
			String memo, String time, int hit, int ref, int indent,
			int step, boolean dayNew)
	{	
		this.setNum(num);
		this.setName(name);
		this.setPassword(password);
		this.setTitle(title);
		this.setMemo(memo);
		this.setTime(time);
		this.setHit(hit);
		this.setRef(ref);
		this.setIndent(indent);
		this.setStep(step);
		this.setDayNew(dayNew);
	}

	public int getNum() { return num; }
	public void setNum(int num) { this.num = num; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getMemo() { return memo; }
	public void setMemo(String memo) { this.memo = memo; }
	public String getTime() { return time; }
	public void setTime(String time) { this.time = time; }
	public int getHit() { return hit; }
	public void setHit(int hit) { this.hit = hit; }
	public int getRef() { return ref; }
	public void setRef(int ref) { this.ref = ref; }
	public int getIndent() { return indent; }
	public void setIndent(int indent) { this.indent = indent; }
	public int getStep() { return step; }
	public void setStep(int step) { this.step = step; }
	public boolean isDayNew() { return dayNew; }
	public void setDayNew(boolean dayNew) { this.dayNew = dayNew; }
}
