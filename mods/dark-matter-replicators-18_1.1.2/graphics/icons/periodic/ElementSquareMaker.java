//Bodge to generate consistent element squares with properly aligned text

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;

import javax.imageio.ImageIO;

public class ElementSquareMaker {
	public static int OUTPUT_SIZE = 128;
	public static String OUTPUT_FORMAT = "jpg";
	public static String FONT = "Times";
	
	public static void main(String[] args) throws IOException
	{ //Load a tab separated table filled with the periodic table of elements and generate squares for all of them
		//Load the file
		BufferedReader reader = new BufferedReader(new FileReader("Elements.csv"));
		String row;
		
		//Read and discard the column names
		reader.readLine();
		
		//Read and output an image for every non-blank row
		while((row = reader.readLine()) != null)
			if(!row.trim().equals(""))
				parseAndSaveSquareFromRow(row);
		
		reader.close();
	}
	
	public static void parseAndSaveSquareFromRow(String rawRow) throws IOException
	{ //Parses a tab separated row of element data and creates a periodic square image file from it
		//Cut the row into sections using commas as indicators
		String row[] = separateColumns(rawRow, ',');
		
		//Put resulting cells into simple variables for better readability
		int atomicNumber = new Integer(row[0]);
		String symbol = row[1];
		String name = row[2];
		double atomicMass = new Double(row[3]);
		
		//Parse the color one character at a time
		String colorCode = row[4];
		float colorValues[] = new float[3];
		for(int i=0; i<colorValues.length; i++) {
			//Each of the three characters is checked individually and converted to a color value
			char value = colorCode.charAt(i);
			if(value == 'x' || value == 'X')
				colorValues[i] = 1;
			else
				colorValues[i] = new Float(String.valueOf(value)) / 10;
		}
		Color color = new Color(colorValues[0], colorValues[1], colorValues[2]);
		
		//Create the square image and save it to a file
		String outputFileName = Integer.toString(atomicNumber+1000).substring(1) + "-" + name.toLowerCase();
		ImageIO.write(generatePeriodicSquare(atomicNumber, symbol, atomicMass, color),
				OUTPUT_FORMAT, new File(outputFileName + "." + OUTPUT_FORMAT));
	}
	public static String[] separateColumns(String row, char separator)
	{ //Splits a row of text into cells
		LinkedList<String> output = new LinkedList<String>();
		int cutPoint;
		while((cutPoint = row.indexOf(separator)) != -1) {
			output.add(row.substring(0, cutPoint));
			row = row.substring(cutPoint+1);
		}
		output.add(row);
		return output.toArray(new String[0]);
	}
	
	public static BufferedImage generatePeriodicSquare(int atomicNumber, String symbol,
			double atomicMass, Color color)
	{ //Uses element data to draw periodic table square for that element
		//Create an empty image
		BufferedImage image = new BufferedImage(OUTPUT_SIZE, OUTPUT_SIZE, BufferedImage.TYPE_INT_RGB);
		Graphics2D painter = image.createGraphics();
		
		//Fill the image with the square's color
		painter.setBackground(color);
		painter.clearRect(0, 0, OUTPUT_SIZE, OUTPUT_SIZE);
		
		//Set the text color
		painter.setColor(Color.BLACK);
		
		//Write the atomic number, symbol and atomic mass on the image
		writeCenter(Integer.toString(atomicNumber), 30, 64, 44, painter);
		writeCenter(symbol, 40, 64, 80, painter);
		writeCenter(String.format("%.3f", atomicMass), 20, 64, 104, painter);
		
		return image;
	}
	private static void writeLeft(String text, int size, int x, int y, Graphics2D writer) {
		writer.setFont(new Font(FONT, Font.PLAIN, size));
		writer.drawString(text, x, y);
	}
	private static void writeCenter(String text, int size, int x, int y, Graphics2D writer) {
		writer.setFont(new Font(FONT, Font.PLAIN, size));
		writeCenteredText(text, x, y, writer);
	}
	private static void writeRight(String text, int size, int x, int y, Graphics2D writer) {
		writer.setFont(new Font(FONT, Font.PLAIN, size));
		writeRightText(text, x, y, writer);
	}
	
	//Functions copied and pasted from a previous project
	public static void writeCenteredText(String text, int x, int y, Graphics2D writer) {
		writer.drawString(text, x - writer.getFontMetrics().stringWidth(text)/2, y);
	}
	public static void writeRightText(String text, int x, int y, Graphics2D writer) {
		writer.drawString(text, x - writer.getFontMetrics().stringWidth(text), y);
	}
/*	public static void writeRotatedText(String text, int x, int y, boolean clockwise, Graphics2D writer) {
		AffineTransform horizontal = writer.getTransform();
		AffineTransform vertical = new AffineTransform();
		if(clockwise)
			vertical.setToRotation(Math.PI/2);
		else
			vertical.setToRotation(-Math.PI/2);
		writer.setTransform(vertical);
		if(clockwise)
			writer.drawString(text, y - writer.getFontMetrics().stringWidth(text)/2, -x);
		else
			writer.drawString(text, -y - writer.getFontMetrics().stringWidth(text)/2, x);
		writer.setTransform(horizontal);
	} */
}
