# Create Sprites and GIF Animations

This document describes my workflow for creating pixel-art sprites and animated GIFs.

---

## Create Sprites

**Tool:** Character Maker 1999

I create the original sprite sheets using Character Maker 1999.

---

## Create a GIF from a Sprite File

### 1. Copy the Original File

**Tool:** File Explorer

Copy the original PNG file and rename it to: <original name> transparent.png

⚠️ **Important:**  
Keep the original file intact. Character Maker 1999 cannot open PNG files that contain transparency or colour count is above 256 in case it has been edited with other program.

---

### 2. Remove the Background and Make It Transparent (optional for GIFs, you can make GIF transparent later)

**Tool:** Paint.NET (fastest)

1. Open the PNG file in Paint.NET
2. Use the **Flood Select** tool to select the background color
3. Press **Delete**
4. Save the file as PNG (transparency is preserved automatically)

**Alternative Tool:** GIMP

1. Open the image in GIMP
2. Go to **Image → Transparency → Add Alpha Channel**
3. Select the background color
4. Press **Delete**
5. Export the image as PNG

---

### 3. Slice the Sprite Sheet into Frame Files

**Tool:** Free TexturePacker GUI

1. Open Free TexturePacker
2. Go to **Tools → Split Sheet**
3. Drag and drop the PNG file using the **Add Image** button
4. On the right side, set the width and height of a single frame
5. Click **Export** and choose an output folder

**Alternative Tool:** GIMP  
You can also slice the sprite sheet using guides and manual cropping, but this method is slower.

---

### 4. Create the GIF

**Tool:** ScreenToGif (fastest)

1. Open ScreenToGif
2. Select **Editor**
3. Drag and drop all frame PNG files
4. Select all frames
5. Set frame duration to **100 ms**
6. Resize to **500%**
   - Scaling method: **Linear** (keeps pixels sharp)
7. Export as **GIF**
   - Make sure transparency is enabled

**Alternative tool:** GIMP

1. Open GIMP
2. Go to **File → Open as Layers**
3. Select all frame files
   - Sort by filename to ensure correct order
4. Go to **Image → Scale Image** to 500% (if resizing is needed)
5. Go to **File → Export As**
6. Choose **GIF**
7. In export options:
   - Enable **As animation**
   - Select **One layer per frame**
   - Disable layer merging (to prevent transparency overlap)

---

## Tools I Use

- **Draw pixel art:** Character Maker 1999
- **Make background transparent:** Paint.NET
- **Slice sprite sheets:** Free TexturePacker GUI
- **Create GIFs:** ScreenToGif
- **Write Markdown files:**
  - Microsoft Visual Studio
  - Notepad++ with MarkdownPanel plugin
