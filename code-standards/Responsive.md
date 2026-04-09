#### Responsive Design

    // Good - responsive layout
    class ResponsiveLayout extends StatelessWidget {
    final Widget mobileLayout;
    final Widget tabletLayout;
    final Widget desktopLayout;
    
    const ResponsiveLayout({
    Key? key,required this.mobileLayout,required this.tabletLayout,required this.desktopLayout}) : super(key: key);
    
        static const int mobileBreakpoint = 600;
        static const int tabletBreakpoint = 900;
    
    @override
    Widget build(BuildContext context) {
        return LayoutBuilder(
        builder: (context, constraints) {
                if (constraints.maxWidth < mobileBreakpoint) {
                    return mobileLayout;
                } else if (constraints.maxWidth < tabletBreakpoint) {
                    return tabletLayout;
                } else {
                    return desktopLayout;
                }
            },
        );
        }
    }
    
    // Usage
    class ProductListScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return ResponsiveLayout(
            mobileLayout: ProductListView(),
            tabletLayout: ProductGridView(crossAxisCount: 2),
            desktopLayout: ProductGridView(crossAxisCount: 4),
        );
        }
    }


