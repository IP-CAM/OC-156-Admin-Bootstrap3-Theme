<?php if (!isset($redirect)) { ?>
    <div class="accordion-inner">
        <div class="checkout-product">
            <table>
                <thead>
                    <tr>
                        <th class="name"><?php echo $column_name; ?></th>
                        <th class="model"><?php echo $column_model; ?></th>
                        <th class="quantity"><?php echo $column_quantity; ?></th>
                        <th class="price"><?php echo $column_price; ?></th>
                        <th class="total"><?php echo $column_total; ?></th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($products as $product) { ?>
                        <tr>
                            <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                              <?php foreach ($product['option'] as $option) { ?>
                              <br />
                              &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                              <?php } ?></td>
                            <td class="model"><?php echo $product['model']; ?></td>
                            <td class="quantity"><?php echo $product['quantity']; ?></td>
                            <td class="price"><?php echo $product['price']; ?></td>
                            <td class="total"><?php echo $product['total']; ?></td>
                        </tr>
                    <?php } ?>
                    <?php foreach ($vouchers as $voucher) { ?>
                        <tr>
                            <td class="name"><?php echo $voucher['description']; ?></td>
                            <td class="model"></td>
                            <td class="quantity">1</td>
                            <td class="price"><?php echo $voucher['amount']; ?></td>
                            <td class="total"><?php echo $voucher['amount']; ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
                <tfoot>
                    <?php foreach ($totals as $total) { ?>
                        <tr>
                            <td colspan="4" class="price"><b><?php echo $total['title']; ?>:</b></td>
                            <td class="total"><?php echo $total['text']; ?></td>
                        </tr>
                    <?php } ?>
                </tfoot>
            </table>
            <div class="clearfix"></div>
            <div class="payment"><?php echo $payment; ?></div>
        </div>
    </div>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script> 
<?php } ?>
<script type="text/javascript"><!--
$(document).ready(function(){
    $('#button-confirm').attr('class','btn btn-primary');
    $('#button-confirm').parent().css('float','none');
});
//--></script> 
