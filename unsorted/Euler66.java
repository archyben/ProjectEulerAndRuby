public class Euler64 {
	
	public static boolean isSquare(long value)
	{
		double root = Math.sqrt(value);
		return Math.floor(root) == root;
	}
	
	public static long resolve(long max)
	{
		long[] res = new long[2];
		for(long d = 900;d<=10000;d++)
		{
			if (isSquare(d))
			{
				continue;
			}
			boolean pass = false;
			long y = 1;
			for (long x=1;true;x++)
			{
				if (pass)
					break;
				while (y<x)
				{
					long value = (long) (Math.pow(x, 2) - d * Math.pow(y, 2));
					if (value==1)
					{
						System.out.println(x + " " + y + " " + d);
						if (x > res[0])
						{
							res[0] = x;
							res[1] = d;
						}
						pass=true;
						break;
					} else if (value < 1) {
						break;
					}
					y++;
				}
			}
		}
		return res[1];
	}
	
	
	public static void main(String[] args) {
		System.out.println(resolve(1000));
	}
}
