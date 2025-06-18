//
//  TransformDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=82
//
//  shape的图形变换  放缩、3d旋转、裁剪形状、描边、旋转、镜像翻转、路径截断
//
//  Created by kempluo on 2025/6/18.
//

import SwiftUI

struct TransformDemoView: View {
    var body: some View {
        HStack {
            Image(.flower)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            Image(.flower)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .scaleEffect(CGSize(width: 0.9, height: 0.9)) // 宽高放大0.9倍

            Image(.flower)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .scaleEffect(CGSize(width: 0.9, height: 0.9))
                .rotation3DEffect(.degrees(50), axis: (x: 0, y: 1, z: 0)) // 3d旋转 50度
        }

        Image(.toronto)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Circle()) // 裁剪成圆形
            .overlay { // 叠加一个边框
                Circle().stroke(Color.red, lineWidth: 2)
            }

        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.red)
                .frame(width: 100, height: 100)

            RoundedRectangle(cornerRadius: 20)
                .rotation(.degrees(30)) // 顺时针旋转30度
                .fill(.red)
                .frame(width: 100, height: 100)
                .padding()
        }

        // 镜像翻转
        HStack {
            Image(.flower)
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 72)
                .rotation3DEffect(.degrees(50), axis: (x: 0, y: 1, z: 0))

            Image(.flower)
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 72)
                .rotation3DEffect(.degrees(50), axis: (x: 0, y: 1, z: 0))
                .scaleEffect(x: -1, y: 1) // 镜像翻转

            Spacer()

            Image(.flower)
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 72)
                .rotation3DEffect(.degrees(50), axis: (x: 1, y: 1, z: 0))

            Image(.flower)
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 72)
                .rotation3DEffect(.degrees(50), axis: (x: 1, y: 1, z: 0))
                .scaleEffect(x: -1, y: -1) // 镜像翻转
        }

        // 路径截断
        HStack {
            Ellipse()
                .stroke(.blue, lineWidth: 5)
                .frame(width: 72, height: 30)

            Ellipse()
                .trim(from: 0, to: 0.20) // 只保留前面20%的路径
                .stroke(.blue, lineWidth: 5)
                .frame(width: 72, height: 30)

            Ellipse()
                .trim(from: 0, to: 0.80) // 只保留前面80%的路径
                .stroke(.blue, lineWidth: 5)
                .frame(width: 72, height: 30)
        }.padding(.top, 20)
    }
}

#Preview {
    TransformDemoView()
}
