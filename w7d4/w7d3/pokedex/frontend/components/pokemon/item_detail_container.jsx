import {connect} from 'react-redux';
import {selectItem} from '../../reducers/selectors';
import ItemDetails from './item_detail';

const mapStateToProps = (state, ownProps) => ({
  itemDetails: selectItem(state, ownProps.params.itemId)
});

export default connect(mapStateToProps)(ItemDetails);
