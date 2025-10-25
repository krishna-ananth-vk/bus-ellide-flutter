import 'package:flutter/material.dart';

class SearchDropDown<T> extends StatefulWidget {
  final List<T> results;
  final String Function(T) displayLabel;
  final bool Function(T) selectedItem;
  final void Function(String) onSearch;
  final void Function(T)? onSelect;
  final void Function(T)? onItemClick;
  final bool isLoading;

  const SearchDropDown({
    super.key,
    required this.results,
    required this.displayLabel,
    required this.selectedItem,
    required this.onSearch,
    this.onSelect,
    this.onItemClick,
    this.isLoading = false,
  });

  @override
  State<SearchDropDown<T>> createState() => _SearchDropDownState<T>();
}

class _SearchDropDownState<T> extends State<SearchDropDown<T>> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _showResults = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _showResults = false;
          _controller.clear();
        });
        widget.onSearch('');
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = widget.results;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                widget.onSearch(value);
                setState(() => _showResults = true);
              } else {
                widget.onSearch('');
                setState(() => _showResults = false);
              }
            },
          ),
        ),
        if (widget.isLoading) const LinearProgressIndicator(),
        if (_showResults && results.isNotEmpty)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            constraints: const BoxConstraints(maxHeight: 300),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: results.length,
              itemBuilder: (context, index) {
                final item = results[index];
                return ListTile(
                  selected: widget.selectedItem(item),
                  title: Text(widget.displayLabel(item)),
                  onTap: () {
                    _controller.text = widget.displayLabel(item);
                    setState(() => _showResults = false);
                    _focusNode.unfocus();
                    widget.onSelect?.call(item);
                    widget.onItemClick?.call(item);
                  },
                );
              },
            ),
          ),
        if (_showResults && results.isEmpty && !widget.isLoading)
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('No results'),
          ),
      ],
    );
  }
}
