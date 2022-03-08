import numpy as np
from gnuradio import gr
import pmt

class blk(gr.sync_block):  # other base classes are basic_block, decim_block, interp_block

    def __init__(self, key = "sc_tag_key", pattern = 0):  # only default arguments here
        gr.sync_block.__init__(
            self,
            name='OFDMA Controller Block',   # will show up in GRC
            in_sig=[np.int8],
            out_sig=[np.int8]
        )

        self.key = key;
        self.pattern = pattern;

    def work(self, input_items, output_items):
        tags = self.get_tags_in_window(0, 0, len(input_items[0]))
        pkey = pmt.intern(self.key)
        ppattern = pmt.to_pmt(self.pattern)
        self.add_item_tag(0, self.nitems_written(0), pkey, ppattern)
        output_items[0][:] = input_items[0]
        return len(output_items[0])
