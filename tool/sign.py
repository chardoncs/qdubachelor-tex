from PIL import Image
import argparse
from array import array

def binarize_signature(input_path, output_path, threshold=128):
    """
    将签名图像处理为黑色签名、透明背景的 RGBA PNG 图（使用 array 加速）。
    """
    img = Image.open(input_path).convert("L")
    width, height = img.size
    gray_data = img.getdata()

    # 使用 array 构造 RGBA 输出
    result_data = array('B')  # unsigned char array

    for gray in gray_data:
        if gray < threshold:
            result_data.extend((0, 0, 0, 255))  # 黑色签名，不透明
        else:
            result_data.extend((0, 0, 0, 0))    # 背景透明

    # 构造 RGBA 图像并写入
    output = Image.frombytes("RGBA", (width, height), result_data.tobytes())
    output.save(output_path)
    print(f"✅ 签名图像处理完成，保存至：{output_path}")

def main():
    parser = argparse.ArgumentParser(description="快速处理签名图为黑字透明背景 PNG（使用 array）")
    parser.add_argument("input", help="输入图像路径")
    parser.add_argument("output", help="输出 PNG 文件路径")
    parser.add_argument("--threshold", type=int, default=128, help="灰度阈值（默认：128）")
    args = parser.parse_args()

    binarize_signature(args.input, args.output, args.threshold)

if __name__ == "__main__":
    main()
