import 'package:flutter/material.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});
  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final List<List<Offset>> _strokes = [];
  List<Offset> _currentStroke = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('✏️ Scratch Pad', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 6),
            Container(
              width: double.infinity, height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GestureDetector(
                  onPanStart: (d) => setState(() => _currentStroke = [d.localPosition]),
                  onPanUpdate: (d) => setState(() => _currentStroke.add(d.localPosition)),
                  onPanEnd: (_) => setState(() {
                    if (_currentStroke.isNotEmpty) _strokes.add(List.from(_currentStroke));
                    _currentStroke = [];
                  }),
                  child: CustomPaint(
                    painter: _CanvasPainter(strokes: _strokes, currentStroke: _currentStroke),
                    size: Size.infinite,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => setState(() { _strokes.clear(); _currentStroke = []; }),
                icon: const Icon(Icons.delete_outline, size: 18),
                label: const Text('Clear'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CanvasPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final List<Offset> currentStroke;
  _CanvasPainter({required this.strokes, required this.currentStroke});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black..strokeWidth = 5
      ..strokeCap = StrokeCap.round..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    void draw(List<Offset> s) {
      if (s.isEmpty) return;
      final path = Path()..moveTo(s.first.dx, s.first.dy);
      for (final p in s.skip(1)) path.lineTo(p.dx, p.dy);
      canvas.drawPath(path, paint);
    }
    for (final s in strokes) draw(s);
    draw(currentStroke);
  }

  @override
  bool shouldRepaint(_CanvasPainter old) => true;
}