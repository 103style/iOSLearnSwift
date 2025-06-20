//
//  iOSLearnApp.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/13.
//

import SwiftUI

@main
struct iOSLearnApp: App {
    ////    @State private var appData = ApplicationData.shared
//    var body: some Scene {
//        WindowGroup {
    ////            ContentView()
    ////            PaddingView() // 间距
    ////            FontView() //  动态大小、固定大小、字体
    ////            ColorView() //  背景、圆角、边框...
    ////            ImageDemoView() // 图片 ImageView
    ////            SFSymbolsDemoView() // SF符号
    ////            EventModifiersDemoView() // 事件操作符
    ////            LayoutDemoView() // 基本布局
    ////            SafeAreaDemoView()  // 安全区域
    ////            LayoutPriorityDemoView() // 布局优先级、视图固定大小操作符
    ////            AlignmentDemoView() // 对齐方式
    ////            CustomAlignmentDemoView() // 自定义对齐方式
    ////            GroupDemoView() // 分组  统一样式、条件语句选择不同视图
    ////            GridsDemoView() // 行列布局  类似手动写Android的GridView
    ////            CustomViewDemoView() // 自定义视图
    ////            CustomLayoutDemoView() // 自定义布局
    ////            GenericViewDemoView() // @ViewBuilder 替换 AnyView 包装，避免影响性能
    ////            ButtonDemoView() // 按钮示例
    ////            TextFieldView() // 输入框示例
    ////            TextEditorDemoView() // 文本编辑器，默认全屏
    ////            ToggleDemoView() // 单选框
    ////            SliderDemoView() // 类似Android的Seekbar
    ////            ProgressViewDemoView() // 自身不可修改进度的进度条，loading状态
    ////            StepperDemoView() // 记步器 提供+-按钮，以及可以设置每次点击的幅度
    ////            GroupBoxDemoView() // 分组，提供了默认的UI样式
    ////            ObservableDemoView() // 模型，全局数据 @Observable @Bindable
    ////            EnvironmentDemoView()
    ////                .environment(appData) // 配置到视图的环境中，只有当前视图能够访问
//
    ////            ForEachDemoView() // List视图
    ////                .environment(GroupApplicationData.shared)
//
    ////            ScrollViewDemoView() // 可滚动，LazyVStack懒加载
    ////                .environment(GroupApplicationData.shared)
//
    ////            ScrollToPostionDemoView() // 滚动到指定位置
    ////                .environment(GroupApplicationData.shared)
//
    ////            LazyGridDemoView() // 网格视图
    ////                .environment(GroupApplicationData.shared)
//
    ////            ListDemoView()
    ////                .environment(GroupApplicationData.shared)
//
    ////            SectionDemoView()
//
    ////            ListEditModeDemoView() // 列表的编辑模式， 测滑删除、单选、多选、自定义编辑模式
    ////                .environment(GroupApplicationData.shared)
//
    ////            SwipeDemoView() // 滑动
    ////                .environment(GroupApplicationData.shared)
//
    ////            ListRefreshDemoView() // 下拉刷新
    ////                .environment(GroupApplicationData.shared)
//
    ////            ExpandListDemoView() // 类似Android的expandedableList
    ////                .environment(GroupApplicationData.shared)
//
    ////            PickerDemoView() // 下拉单选框、单选按钮
    ////            DatePickerDemoView() // 日期选择器，设置可选择范围， 多选
//
    ////            NavigationStackDemoView() // 导航
    ////                .environment(GroupApplicationData.shared)
    ////            NavigationMenuDemoView() // 导航二级菜单
    ////                .environment(GroupApplicationData.shared)
    ////            NavigationSearchDemoView() // 带搜索的导航栏
    ////                .environment(GroupApplicationData.shared)
    ////            SearchSuggestDemoView() // 搜索建议
    ////                .environment(GroupApplicationData.shared)
    ////            SearchControlDemoView() // 手动控制退出搜索
    ////                .environment(GroupApplicationData.shared)
    ////            SearchRangeDemoView() // 搜索范围 示例
    ////                .environment(GroupApplicationData.shared)
//
    ////            NavigationLinkDemoView() // 页面跳转，修改默认的返回按钮
    ////                .environment(GroupApplicationData.shared)
//
    ////            PopoverDemoView() // 弹框视图
//
    ////            AlertViewDemoView() // .alert：输入警告 & .confirmationDialog：确认弹框
//
    ////            TipsDemoView() // 提示
//
    ////            TabViewDemoView() // 多tab布局
    ////            TabWithSearchDemoView() // 带搜索按钮的多tab布局
    ////            TabPageDemoView()  // tab的样式设置示例
    ////            SliderViewDemoView() // 侧边栏 iphone 和 ipad 的区别
//
    ////            SizeClassDemoView() // 横竖屏
    ////            GeometryReaderDemoView() // 通过 GeometryReader 判断横竖屏
//
//            // todo
//            // https://www.bilibili.com/video/BV187E3zLEbi?p=36
//            // https://www.bilibili.com/video/BV187E3zLEbi?p=37
//            // https://www.bilibili.com/video/BV187E3zLEbi?p=38
//            // iphone ipad适配
//
    ////            AsyncDemoView() // 异步任务示例
    ////            AsyncErrorInfoDemoView() // 异步任务错误信息获取示例
    ////            AsyncConcurrentDemoView() // 异步并发
    ////            AsyncDataSyncDemoView() // 异步编程数据同步问题
    ////            MainThreadDemoView() // 执行在主线程的示例
//
    ////            AsyncSequenceDemoView() // 异步迭代序列示例
    ////            AsyncTaskGroupDemoView() // 异步任务组示例
    ////            AsyncImageDemoView() // 异步加载网络图片
//
//            // 数据持久化
//            AppStorageDemoView()
//        }
//    }
//

    // ----------------------------------------------------------------------------
    // SwiftData 数据持久化 示例, 菜单的添加和删除
//    @State private var appData = FoodStorageManage.shared
//
//    var body: some Scene {
//        WindowGroup {
//            SwiftDataDemoView()
//                .environment(appData)
//                .modelContainer(for: [Food.self])
//        }
//    }

    // ----------------------------------------------------------------------------

    // -----------------------------本地文件读写START--------------------------------------
//    var body: some Scene {
//        WindowGroup {
//            FileDemoView()
//                .environment(FileApplicationData.shared)

//            TextFileDemoView()
//                .environment(TextApplicationData.shared)
//        }
//    }
    // -----------------------------本地文件读写END--------------------------------------

    // -------------------------------文档操作START---------------------------------------
//    var body: some Scene {
    ////        DocumentGroup(newDocument: TextDocument(), editor: { config in
    ////            TextDocumentDemoView(document: config.$document)
    ////
    ////
    ////        })
//
//        WindowGroup {
//            DocumentExportImportDemoView() // 文档导出导入示例
//        }
//    }
    // -------------------------------文档操作END---------------------------------------

    //  -------------------------------11章 shapes Charts STRAT---------------------------------------
//    var body: some Scene {
//        WindowGroup {
//            // ShapeDemoView() // 形状样式
//            // StrokeStyleDemoView() // 边框设置示例
//            // ShapeAsBgDemoView() // shape作为背景  圆角按钮示例
//            // GradientDemoView() // 渐变介绍
//            // ShapeEffectsDemoView() // 添加阴影
//            // ShapePatternsDemoView() // 背景用图片填充示例
//            // PathDemoView() // 自定义路径示例，类似Andorid自定义View中用的的Path
//            // TransformDemoView() // shape的图形变换  放缩、3d旋转、裁剪形状、描边、旋转、镜像翻转、路径截断
//            // CanvasDemoView() //  画 图片、各种形状、文字示例
//            // CanvasBestDrawImageDemoView() // 画图片的最佳方式， 使用 context.resolve(Image(.flower)) 提前解析图片已提升性能
//            // CanvasClipDemoView() // 画布裁剪示例
//            // CanvasMultiLayerDemoView() // 不同配置的画布示例
//            CanvasApplyFiltersDemoView() // 配置滤镜

    // ------------------------------------
    // ChartsBarMarkDemoView() // 条形图表
    // ChartsLineMarkDemoView() // 这些图表
    // ChartsOtherMarkDemoView() // 点、矩形、区域图表
    // ChartsModifiesDemoView() // 图标修饰符
    // ChartsWithDiffMarksDemoView() // 多个图表混合展示
    // ChartsWithSelcetionDemoView() // 显示选中图表的示例
    // ChartsMathDemoView() // 数学函数图表
    // ChartsWithTwoSeriesValueDemoView() // 显示多组数据，配置不同的颜色、位置
    // ChartsScrollDemoView() // 图表支持可滚动
//        }
//    }

    //  -------------------------------11章 shapes Charts END---------------------------------------

    // 图像渲染器
//    var body: some Scene {
//        WindowGroup {
//            ImageRenderDemoView() // 图像渲染器
//        }
//    }

    // ------------------------------- 动画 START ---------------------------------------
//    var body: some Scene {
//        WindowGroup {
//            // AnimationSimpleDemoView() // 简单动画示例
//            // AnimationCustomShapeDemoView() // 动画控制自定义视图， 主要是根据 animatableData值的变化 改变属性值， 重绘视图
//            // AnimationCreateDemoView() // 通过TimelineView的时间创建一个实现圆半径变化的动画
//            // AnimationTransitionsDemoView() // 通过 .transition 添加过渡动画  自定义过渡动画示例
//            // AnimationCoordinatingTransitionsDemoView() // 动画组 通过 matchedGeometryEffect 同一个组使用统一的 id 和 in
//            AnimationWithSFSymbolsDemoView() // 通过 symbolEffect 对SF符号进行动画
//        }
//    }
    // ------------------------------- 动画 END ---------------------------------------

    // ------------------------------- 手势 START ---------------------------------------
    var body: some Scene {
        WindowGroup {
            // SimpleGustureDemoView() // 点击、长按 操作示例
            // GestureEnableDemoView() // 设置 是否允许点击、 通过.contentShape设置内容形状才配置点击响应区域
            GestureStructDemoView() // .gesture 操作符 响应手势，.updating更新 .onEnded响应
        }
    }
    // ------------------------------- 手势 END ---------------------------------------
}
