
package com.k4m.dx.tcontrol.monitoring.schedule.util;

public class BitUtil {
	public static long composite(int hkey, int wkey) {
		return (long) hkey << 32 | ((long) wkey & 0xffffffffL);
	}
	public static int composite(short hkey, short wkey) {
		return ((int) hkey << 16) | ((int) wkey & 0xffff);
	}
	public static short composite(byte hkey, byte wkey) {
		return (short) (((short) hkey << 8) | ((short) wkey & (short) 0xff));
	}
	
	public static long setHigh(long src, int hkey) {
		return (src & 0x00000000ffffffffL) | (long) hkey << 32;
	}
	public static long setLow(long src, int wkey) {
		return (src & 0xffffffff00000000L) | ((long) wkey & 0xffffffffL);
	}

	public static int getHigh(long key) {
		return (int) (key >>> 32) & 0xffffffff;
	}

	public static int getLow(long key) {
		return (int) key & 0xffffffff;
	}
	public static short getHigh(int key) {
		return (short) ((key >>> 16) & (short) 0xffff);
	}

	public static short getLow(int key) {
		return (short) (key & (short) 0xffff);
	}

	public static byte getHigh(short key) {
		return (byte) ((key >>> 8) & (short) 0xff);
	}

	public static byte getLow(short key) {
		return (byte) (key & (short) 0xff);
	}
	public static void main(String[] args) {
		int h=0;
		int w=-1;
		long ww = composite(h,w);
		System.out.println(ww);
		System.out.println(getLow(ww));
		System.out.println(setLow(0L, -1));
	}
}